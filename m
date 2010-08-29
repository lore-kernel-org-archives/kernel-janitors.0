From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 29 Aug 2010 13:06:42 +0000
Subject: Re: [PATCH 5/7] drivers/regulator: Remove double test
Message-Id: <20100829130642.GA10233@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283010066-20935-1-git-send-email-julia@diku.dk>
 <1283010066-20935-6-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-6-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 28, 2010 at 05:41:04PM +0200, Julia Lawall wrote:
> The current code tests the gpio_vid0 field twice.  Test the gpio_vid1
> fields in place of the second gpio_vid0 test.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
