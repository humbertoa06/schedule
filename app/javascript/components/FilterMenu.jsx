import React, { Fragment } from 'react';
import { Menu, Transition } from '@headlessui/react';

const keysToFilter = [
  { key: "first_name_asc",  alias: 'Fist Name - Asc', order_by: 'first_name', sort_order: 'asc' },
  { key: "first_name_desc", alias: 'Fist Name - Desc', order_by: 'first_name', sort_order: 'desc' },
  { key: "last_name_asc",   alias: 'Last Name - Asc', order_by: 'last_name', sort_order: 'asc' },
  { key: "last_name_desc",  alias: 'Last Name - Desc', order_by: 'last_name', sort_order: 'desc' }
]

const FilterMenu = ({ filterSelected, handleFilterClick }) => (
  <>
    <div className="relative inline-block text-left">
      Sort by:
      <Menu as="div" className="relative inline-block text-left">
        <div>
          <Menu.Button className="inline-flex w-full justify-center gap-x-1.5 rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">
            {filterSelected}
            <svg className="-mr-1 h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
            </svg>
          </Menu.Button>
        </div>

        <Transition
          as={Fragment}
          enter="transition ease-out duration-100"
          enterFrom="transform opacity-0 scale-95"
          enterTo="transform opacity-100 scale-100"
          leave="transition ease-in duration-75"
          leaveFrom="transform opacity-100 scale-100"
          leaveTo="transform opacity-0 scale-95"
        >
          <Menu.Items className="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
            <div className="py-1">
              {keysToFilter.map((menuItem) => (
                <Menu.Item key={menuItem.key}>
                  <a
                    href="#"
                    value={menuItem.alias}
                    className="text-gray-700 block px-4 py-2 text-sm"
                    onClick={(event) => handleFilterClick(event, { order_by: menuItem.order_by, sort_order: menuItem.sort_order }, menuItem.alias)}
                  >
                    {menuItem.alias}
                  </a>
                </Menu.Item>
              ))}
            </div>
          </Menu.Items>
        </Transition>
      </Menu>
    </div>
  </>
);

export default FilterMenu;