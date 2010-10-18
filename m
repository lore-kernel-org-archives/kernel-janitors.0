From: Paul Fulghum <paulkf@microgate.com>
Date: Mon, 18 Oct 2010 20:39:36 +0000
Subject: Re: [PATCH 7/8] char: synclink_gt: fix information leak to userland
Message-Id: <4CBCB7BA.5080601@microgate.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287326496-8178-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287326496-8178-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org


Acked-by: Paul Fulghum <paulkf@microgate.com>

On 10/17/2010 8:41 AM, Vasiliy Kulikov wrote:
> Structures tmp_params and new_line are copied to userland with some padding
> fields unitialized.  It leads to leaking of stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>


-- 
Paul Fulghum
MicroGate Systems, Ltd.
=Customer Driven, by Design(800)444-1982
(512)345-7791 (Direct)
(512)343-9046 (Fax)
Central Time Zone (GMT -6h)
www.microgate.com
