const { test, expect } = require("@playwright/test");
const path = require("path");
const { _electron: electron } = require("playwright");

test.describe("Electron basic app test", () => {
  let app;

  test.beforeAll(async () => {
    app = await electron.launch({ args: ["."] });
  });

  test.afterAll(async () => {
    await app.close();
  });

  test("should open a window and load the first page", async () => {
    const window = await app.firstWindow();
    const title = await window.title();
    expect(title).toBe(""); // Set <title> in your HTML if needed
  });

  test("should show the button to go next", async () => {
    const window = await app.firstWindow();
    const button = await window.locator("text=next");
    await expect(button).toBeVisible();
  });
});
