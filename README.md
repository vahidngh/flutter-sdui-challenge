Dynamic Form Builder
============

## Task Description

We want to build a dynamic form builder in Flutter that fetches its structure from a server and displays it on a page. The form will include three input types:

- Text input
- Select box
- File upload field

## Key Steps:

1. API Request: Send a request to retrieve the form structure from the server, which includes field types, labels, options, and validation rules.

2. Render the Form: Dynamically generate the form on the page based on the retrieved structure, creating the appropriate input fields (text, select, and file fields).

3. Submit Button: Add a submit button that collects all form data (including file uploads) when clicked.

4. Form Validation: Ensure that all required fields are filled out and meet validation rules (e.g., text length, required selections, file formats) before allowing submission.

5. Send Form Data: Once submitted, package and send the form data back to the server via another API call.

This approach allows for flexible forms that can be easily updated server-side without modifying the app’s code.


Sample response for getting form (Feel free to restructure the response if you think it would enhance clarity or effectiveness):

```
{"fields":[{"label":"برند:","name":"brand","props":{"color":"#000000","placeholder":"برند ماشین را وارد کنید","size":"large","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"مدل:","name":"model","props":{"color":"#000000","placeholder":"مدل ماشین را وارد کنید","size":"medium","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"سال ساخت:","name":"year","props":{"max":"2024","min":"1900","placeholder":"سال ساخت را وارد کنید","type":"number"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"نوع سوخت:","name":"fuel_type","props":{"options":[{"label":"بنزین","value":"بنزین"},{"label":"گاز","value":"گاز"},{"label":"دیزل","value":"دیزل"},{"label":"الکتریکی","value":"الکتریکی"}]},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"select"},{"label":"رنگ ماشین:","name":"color","props":{"placeholder":"رنگ ماشین را وارد کنید","type":"text"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"تعداد مالکین قبلی:","name":"previous_owners","props":{"min":"0","placeholder":"تعداد مالکین قبلی را وارد کنید","type":"number"},"style":{"borderRadius":"5px","margin":"10px 0","padding":"8px"},"type":"input"},{"label":"توضیحات وضعیت فنی:","name":"technical_condition","props":{"cols":50,"placeholder":"توضیحات درباره وضعیت فنی ماشین","rows":4},"style":{"borderRadius":"5px","margin":"10px 0","padding":"10px"},"type":"textarea"},{"label":"تصاویر ماشین:","name":"car_images","props":{"accept":"image/*","maxSize":"5MB","multiple":true},"style":{"margin":"10px 0"},"type":"file"}]}
```

Suppose the backend APIs are concurrently in the development process. So mock APIs in some way clean to continue your work.


## Implementation details


Try to write your code as **reusable** and **readable** as possible. The architecture of your code and where you integrate your design system within the project are important to us.

Also, don't forget to **document your code** and clear the reasons for all your decisions in the code.

It is more valuable to us that the project comes with unit tests.

Please fork this repository and add your code to that. Don't forget that your commits are so important.
So be sure that you're committing your code often with a proper commit message.
