From: Chris Ball <cjb@laptop.org>
Date: Wed, 08 Aug 2012 03:57:51 +0000
Subject: Re: [PATCH 2/2] drivers/mmc/host/vub300.c: add missing usb_free_urb
Message-Id: <878vdqujb4.fsf@octavius.laptop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343142370-27876-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343142370-27876-2-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Tue, 24 Jul 2012 17:06:10 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Tony Olech <tony.olech@elandigitalsystems.com>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Tue, Jul 24 2012, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Add missing usb_free_urb on failure path after usb_alloc_urb.

Thanks, pushed to mmc-next for 3.7.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
