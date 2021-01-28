From: Joe Perches <joe@perches.com>
Date: Thu, 28 Jan 2021 20:51:35 +0000
Subject: Re: [PATCH] staging: net: wimax: i2400m: fw: remove redundant initialization of variable result
Message-Id: <4feb2701856a0a05ce22f27adf1ade679695cfe5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128173703.645328-1-colin.king@canonical.com>
In-Reply-To: <20210128173703.645328-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2021-01-28 at 17:37 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable result is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.

Isn't WIMAX dead?  Shouldn't it be marked ORPHAN in MAINTAINERS?
---
diff --git a/MAINTAINERS b/MAINTAINERS
index caac09a3c5c9..922afd393cb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19201,6 +19201,10 @@ S:     Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/wil6210
 F:	drivers/net/wireless/ath/wil6210/
=20
+WIMAX
+S:	Orphan
+F:	drivers/staging/wimax/
+
 WINBOND CIR DRIVER
 M:	David H=E4rdeman <david@hardeman.nu>
 S:	Maintained
