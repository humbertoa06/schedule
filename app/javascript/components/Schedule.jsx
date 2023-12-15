import React, { useEffect, useState } from 'react';
import FilterMenu from './FilterMenu';
import EmployeeTable from './EmployeeTable';

const Schedule = () => {
  const [employees, setEmployees] = useState([]);
  const [totalHours, setTotalHours] = useState([]);
  const [filterSelected, setFilterSelected] = useState('First Name - Asc');
  const [queryParams, setQueryParams] = useState({order_by: 'first_name', sort_order: 'asc'});

  useEffect(() => {
    const fetchShifts = async () => {
      try {
        const queryString = new URLSearchParams(queryParams).toString();
        const url = `/shifts?${queryString}`;

        const response = await fetch(url, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json'
          }
        });

        if (response.ok) {
          const data = await response.json();
          setEmployees(data);
        } else {
          throw new Error('Error en la solicitud al servidor');
        }
      } catch (error) {
        console.error('Error:', error);
      }
    };

    fetchShifts();
  }, [queryParams]);

  useEffect(() => {
    fetch('/total_hours')
      .then(response => response.json())
      .then(data => setTotalHours(data))
      .catch(error => console.error('Error fetching total hours:', error));
  }, []);

  const handleFilterClick = (event, params, alias) => {
    event.preventDefault();
    setFilterSelected(alias);
    setQueryParams(params);
  };

  return (
    <>
      <div className="px-4 sm:px-6 lg:px-8">
        <div className="sm:flex sm:items-center">
          <div className="sm:flex-auto">
            <FilterMenu
              filterSelected={filterSelected}
              handleFilterClick={handleFilterClick}
            />
          </div>
        </div>
        <div className="mt-8 flow-root">
          <EmployeeTable employees={employees} totalHours={totalHours} />
        </div>
      </div>
    </>
  );
};

export default Schedule;