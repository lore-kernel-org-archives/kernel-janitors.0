From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Dec 2016 08:13:42 +0000
Subject: Re: [PATCH 1/2] pinctrl: sirf: atlas7: Add missing 'of_node_put()'
Message-Id: <CACRpkdZP1E6Br=oiqxR1hOxSacUBDCkKW5dhuiXBvxrERXpx0g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161220054043.25417-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161220054043.25417-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Dec 20, 2016 at 6:40 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Reference to 'sys2pci_np' should be dropped in all cases here, not only in
> error handling path.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
