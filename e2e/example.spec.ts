import { test, expect } from "@playwright/test";
import { appUrl } from "./environment";
import { MainPageIds } from "./selectors/main-page";

test.describe("main page functionality", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(appUrl);

    await page.waitForLoadState("load");
  });

  test("verify url is correct", async ({ page }) => {
    expect(page.url()).toBe("https://www.google.com.ua/");
  });

  test("verify logo is shown", async ({ page }) => {
    const logo = page.locator(MainPageIds.Logo);

    await expect(logo).toBeVisible();
  });

  test("verify search field is visible", async ({ page }) => {
    const searchBar = page.locator(MainPageIds.SearchBar);

    await expect(searchBar).toBeVisible();
  });
});
