From: Kevin Hilman <khilman@baylibre.com>
Date: Tue, 12 Mar 2019 20:28:41 +0000
Subject: Re: [PATCH 09/12] meson-gx-socinfo: add missing of_node_put after of_device_is_available
Message-Id: <7hh8c7u9ae.fsf@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> Add an of_node_put when a tested device node is not available.

[...] 
]

> Fixes: a9daaba2965e8 ("soc: Add Amlogic SoC Information driver")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied,

Thanks,

Kevin
