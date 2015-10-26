From: Jacek Anaszewski <j.anaszewski@samsung.com>
Date: Mon, 26 Oct 2015 08:48:31 +0000
Subject: Re: [PATCH 0/9] add missing of_node_put
Message-Id: <562DE8DF.5090609@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

Hi Julia,

Patches 1-4 have been applied to the LED tree, thanks.

On 10/24/2015 04:42 PM, Julia Lawall wrote:
> The various for_each device_node iterators performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.
>
> The complete semantic patch that fixes this problem is
> (http://coccinelle.lip6.fr):
>
[...]

-- 
Best Regards,
Jacek Anaszewski
