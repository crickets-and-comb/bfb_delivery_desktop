const { test, expect } = require("@playwright/test");
const path = require("path");
const { _electron: electron } = require("playwright");

let app;
const skipElectronTests = process.env.DISABLE_ELECTRON_TESTS === "true";

test.describe("Electron basic app test", () => {
  test.beforeAll(async ({}, testInfo) => {
    if (skipElectronTests) {
      test.skip(true, "Skipping Electron tests in CI/headless mode");
    }

    app = await electron.launch({ args: ["."] });
  });

  test.afterAll(async () => {
    if (app) {
      await app.close();
    }
  });

  test("should open a window and load the first page", async () => {
    const window = await app.firstWindow();
    const title = await window.title();
    expect(title).toBe("");
  });

  test("should show the button to go next", async () => {
    const window = await app.firstWindow();
    const button = await window.locator("text=next");
    await expect(button).toBeVisible();
  });
});
