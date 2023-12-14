# Shoesly 

## Project Overview

This Flutter project is a mobile application that focuses on sneakers. Users can explore, filter, and view a diverse collection of sneakers. The app is built using Flutter, providing a cross-platform solution for both iOS and Android.

## Table of Contents

- [Project Setup Instructions](#project-setup-instructions)
- [Assumptions](#assumptions)
- [Challenges and Solutions](#challenges-and-solutions)
- [Additional Features and Improvements](#additional-features-and-improvements)
- [Table of Contents](#table-of-contents)

## Project Setup Instructions

### Prerequisites

Before getting started, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Clone and Run

1. Clone the repository to your local machine.

    ```bash
    git clone https://github.com/your-username/sneaker-app.git](https://github.com/zeb9988/shoesly.git
    ```

2. Navigate to the project directory.

    ```bash
    cd sneaker-app
    ```

3. Install dependencies.

    ```bash
    flutter pub get
    ```

4. Run the app.

    ```bash
    flutter run
    ```

## Assumptions

During the development of this project, certain assumptions were made:

1. **Data Source:** The application assumes a predefined list of sneakers provided by the `dummyShoes` list in the code.

2. **UI/UX Design:** Design choices and UI layouts are based on the provided code snippets and the Figma design provided (https://www.figma.com/file/hWQUR1ByavH4Dn2AyOIYH7/Code-Test-for-Shoesly---Brand-Marketplace-Apps-UI-Kit?type=design&node-id=1-6&mode=design&t=zSBkcJD7ie3cEU1z-0). Any modifications can be made as per specific design requirements. The Figma design serves as a reference for the overall look and feel of the application. 
## Challenges and Solutions

### Challenges Faced
#### Challenge: Counter Increments Smoke Test - 
**Description:**  The counter increments smoke test failed, leading to unexpected results in the widget tree. 
- **Details:** The test was expecting one matching node in the widget tree but none were found. This was identified in the test logs.
- **Solution:** Reviewed the test code, identified discrepancies in the expected widget tree, and corrected the test description. This resolved the issue and ensured the counter increments smoke test passed successfully. 

### Challenge: Passing Filtered Products

- **Description:** Needed to pass filtered products to the Filter screen based on the current tab in DiscoverPage.

- **Solution:** Implemented a method (`_getFilteredProducts()`) to determine the current tab and filter products accordingly.


## Additional Features and Improvements 

### 1. Filter Screen -

**Description:** Implemented a dedicated Filter screen allowing users to filter products based on brand and price range. - 
**Details:** The Filter screen enhances the user experience by providing advanced filtering options, contributing to a more refined product discovery process. 

### 2. Discover Page - 

**Description:** Enhanced the Discover page with sorting options, including most recent, lowest price, and highest reviews. 
- **Details:** Users can now sort the displayed products based on different criteria, providing flexibility and a personalized shopping experience.
- 
 ### 3. UI Enhancements
 
 **Description:** Improved the overall UI design with custom tabs and a responsive layout. 
**Details:** The UI enhancements contribute to a more visually appealing and user-friendly interface, providing a seamless and engaging experience.

 ### 4. Additional Enhancements
 
**Check-in Screens:** Added loading indicators in various screens to improve user feedback during data fetching processes.
 **Unit Testing:** Conducted comprehensive unit testing for the entire provider state management to ensure code reliability. 
**Error Handling:** Implemented dialog boxes to display detailed error messages and snackbars for better user notification in case of errors. 

Feel free to contribute, report issues, or suggest improvements to make this Sneaker App even better!

