import React from 'react';

const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const days = [0, 1, 2, 3, 4, 5, 6];

const tableHeaders = (totalHours) => {

daysOfWeek.map((day, index) => (
    <th
      key={day}
      scope="col"
      className={`${
        index % 2 === 0 ? 'pl-4 pr-4 sm:pl-0' : 'px-4'
      } py-3.5 text-left text-sm font-semibold text-gray-900`}
    >
      {`${day}(${totalHours[index]} hrs)`}
    </th>
  ));
}

const EmployeeTable = ({ employees, totalHours }) => (
  <>
    <div className="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
        <table className="min-w-full divide-y divide-gray-300">
          <thead>
            <tr className="divide-x divide-gray-200">
              <th
                scope="col"
                className="py-3.5 pl-4 pr-4 text-left text-sm font-semibold text-gray-900 sm:pl-0"
              >
                Employee Name
              </th>
              {daysOfWeek.map((day, index) => (
                <th
                  key={day}
                  scope="col"
                  className={`${
                    index % 2 === 0 ? 'pl-4 pr-4 sm:pl-0' : 'px-4'
                  } py-3.5 text-left text-sm font-semibold text-gray-900`}
                >
                  {`${day}(${totalHours[index]} hrs)`}
                </th>
              ))}
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200 bg-white">
            {employees.map((employee) => (
              <tr key={employee.id} className="divide-x divide-gray-200">
                <td className="whitespace-nowrap py-4 pl-4 pr-4 text-sm font-medium text-gray-900 sm:pl-0">
                  {`${employee.first_name} ${employee.last_name}`}
                </td>
                {days.map(day => {
                  const shiftForDay = employee.shifts.find(shif => shif.day == day)
                  return (
                    <td className={`bg-${shiftForDay ? shiftForDay.color : 'white'}-400 max-w-0 py-5 pl-4 pr-3 text-sm sm:pl-0`}>
                      <div className="font-medium text-gray-900">{shiftForDay ? `${shiftForDay.start_at} - ${shiftForDay.end_at}` : ''}</div>
                      <div className="mt-1 truncate text-gray-900">{shiftForDay ? shiftForDay.role : ''}</div>
                    </td>
                  );
                  }
                )}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  </>
);

export default EmployeeTable;