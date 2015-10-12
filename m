From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 12 Oct 2015 11:14:17 +0000
Subject: Re: [RESEND PATCH v2] staging/wlan-ng: Fix potential buffer overflow in firmware handling
Message-Id: <20151012110217.GF13596@sudip-pc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444506976-11098-1-git-send-email-theidsieck@leenox.de>
In-Reply-To: <1444506976-11098-1-git-send-email-theidsieck@leenox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 10, 2015 at 09:56:16PM +0200, Tillmann Heidsieck wrote:
> This patch fixes a potential buffer overflow detected by smatch.
> 
> pda16 has length 512, while processing an element with index < 512 we
> are checking for an end marker in the next element. This poses a
> potential buffer overflow if no end marker is present.
> 
> Signed-off-by: Tillmann Heidsieck <theidsieck@leenox.de>
> ---

Confused.
This you have already sent previously and has already been merged by
Greg.
4ccb726c728c ("staging: wlan-ng fix buffer overflow in firmware handling")

Signed-off-by: Tillmann Heidsieck <theidsieck@leenox.de>
Dated: Wed Sep 23

regards
sudip
