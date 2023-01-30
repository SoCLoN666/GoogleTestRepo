import { test, expect } from "@playwright/test";
import { appUrl } from "./environment";

test("has title", async ({ page }) => {
  await page.goto(appUrl);

  // Expect a title "to contain" a substring.
  expect(page.url()).toBe("https://www.google.com.ua/");
});

// test("get started link", async ({ page }) => {
//   await page.goto("https://playwright.dev/");

//   // Click the get started link.
//   await page.getByRole("link", { name: "Get started" }).click();

//   // Expects the URL to contain intro.
//   await expect(page).toHaveURL(/.*intro/);
// });
