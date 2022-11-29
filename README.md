# exhibition_task

A new Flutter project.

## Getting Started

This is a flutter project which is aimed at displaying information about objects at exhibitions

This project was created using MVVM (Model-View-ViewModel) pattern flutter architecture with provider as a state management

Details on how the folder structure is located in the lib folder

Moreso, the UI/UX (ui subfolder on the lib folder) contains 2 files which dislays the 2 major ways of fetching data from a REST API

The first method is using the model to get and store the data received so the the consumer widget in the provided can have access to it in orrde to display it on the UI

The second method is getting the data using the Future builder which asyncronously listens to the data while the circular progess indication performs its work before rendering the data on successful API response

For the sake of this project, both methods were simplified. This makes it possible to get the data even when there is no network connection

The route is structured in a way that is switchable to test for each method

Basically, Material3 designs template was used throughout the whole app implementation
