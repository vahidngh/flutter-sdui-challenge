# Dynamic Form Builder

## Documentation and Decision Rationale

In building this dynamic form builder, I’ve made several design and implementation decisions to ensure the project is maintainable, scalable, and user-friendly. Below, I’ve documented the key decisions and their rationale to provide clarity for anyone reviewing or contributing to the codebase.

---

### 1. Why Provider for State Management?
I chose **Provider** for state management because it's lightweight, easy to use, and integrates seamlessly with Flutter. It allows me to manage the form state efficiently without overcomplicating the architecture. By using `ChangeNotifier`, I can easily notify the UI of state changes, ensuring the form updates dynamically as the user interacts with it.

---

### 2. Dynamic Form Rendering
The form is rendered dynamically based on the structure fetched from the server. This approach was chosen to ensure flexibility - if the form structure changes on the server, the app can adapt without requiring a code update. Each field type (text, select, file upload, etc.) is mapped to a reusable widget, making the code modular and easy to extend.

---

### 3. Validation Logic
Validation is handled at two levels:
- **Field-level validation**: Each input widget validates its own data (e.g., required fields, number validation). This ensures immediate feedback to the user.
- **Form-level validation**: Before submission, the `FormProvider` checks if all required fields are filled and valid. This prevents invalid data from being submitted.

I chose to reuse the validation logic in both the `validator` and `onChanged` callbacks to ensure consistency and avoid redundant code.

---

### 4. File Handling
Picking files is handled using the `file_picker` package. Files are stored as `List<PlatformFile>` and converted to a `Map<String, dynamic>` for submission. This approach was chosen to:
- Simplify file handling (e.g., accessing file bytes, paths, and metadata)
- Ensure compatibility with backend APIs that expect file data in a structured format

---

### 5. Unit Testing
While I've written unit tests for the core functionality, there's room for more comprehensive testing. Admittedly, I haven't covered every edge case yet due to:
- Time constraints
- Complexity of mocking certain dependencies (e.g., file picker, API calls)
- Focus on delivering core functionality first

However, the existing tests provide a solid foundation, and I plan to expand test coverage as the project evolves.

---

### 6. Code Reusability
I've prioritized writing reusable components (e.g., `CustomTextInput`, `CustomFileInput`) to:
- Minimize code duplication
- Improve maintainability
- Simplify addition of new field types

---

### 7. Documentation
I followed Clean Code principles by:
- Using meaningful, descriptive names for variables/functions/classes
- Adding inline comments for complex logic
- Maintaining this high-level documentation in the README
- Ensuring self-documenting code structure

---

## Why More Unit Tests Are Needed (But Not Fully Implemented Yet)
While I recognize the importance of thorough unit testing, comprehensive test coverage is still a work in progress due to:

1. **Time Constraints**: Balancing feature development with testing has been challenging given the dynamic nature of the form builder
2. **Complex Dependencies**: Some components (e.g., file picker, API calls) require complex mocking setups
3. **Evolving Requirements**: New edge cases and requirements continue to emerge as the project grows

That said, I've ensured that the core functionality (form state management, validation) is well-tested, and I'm committed to expanding test coverage as the codebase stabilizes.

---

## Conclusion
This project has been a great learning experience in building dynamic, data-driven Flutter applications. Key achievements include:
- Flexible form rendering system
- Robust state management architecture
- Reusable component library
- Effective validation pipeline

I'm proud of the progress so far and welcome any feedback or suggestions for improvement.
