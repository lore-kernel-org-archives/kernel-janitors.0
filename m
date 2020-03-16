From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Mar 2020 09:23:40 +0000
Subject: [PATCH][next] tools: gpio-hammer: fix spelling mistake: "occurences" -> "occurrences"
Message-Id: <20200316092340.114125-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/gpio/gpio-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 083399d276e4..28d2329e83d2 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -153,7 +153,7 @@ int main(int argc, char **argv)
 
 	if (i >= GPIOHANDLES_MAX) {
 		fprintf(stderr,
-			"Only %d occurences of '-o' are allowed, %d were found\n",
+			"Only %d occurrences of '-o' are allowed, %d were found\n",
 			GPIOHANDLES_MAX, i + 1);
 		return -1;
 	}
-- 
2.25.1
