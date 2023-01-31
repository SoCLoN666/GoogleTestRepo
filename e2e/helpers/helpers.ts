import { Page } from "@playwright/test";

export async function removeDuplicatedElements(page: Page) {
  await page.locator('[class="RNmpXc"] >> nth=0').evaluate((e) => e.remove());
}
