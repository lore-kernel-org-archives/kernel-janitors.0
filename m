From: Szymon Janc <szymon@janc.net.pl>
Date: Thu, 09 Feb 2012 20:14:18 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <201202092114.18435.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

> Ok, I think I got the right ones, please check that I did.

Those 2 (minor) are still not applied

Staging: quickstart: Use scnprintf in quickstart_pressed_button_show
Staging: quickstart: Bump driver version to 1.04

> Also, you just created the following build warning, please send me a
> patch fixing it up:
> 
> drivers/staging/quickstart/quickstart.c: In function
> ‘quickstart_acpi_ghid’: drivers/staging/quickstart/quickstart.c:212:5:
> warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument
> 3 has type ‘acpi_size’ [-Wformat]

acpi_size is u32 or u64 depending on arch, is it ok to just cast it to 
unsigned int for printing?

-- 
Szymon K. Janc
szymon@janc.net.pl

