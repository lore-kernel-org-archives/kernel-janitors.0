From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 22 Dec 2009 22:17:56 +0000
Subject: Re: [PATCH 1/6] drivers/dma: Correct use after free
Message-Id: <e9c3a7c20912221417x46f85df5o73071a64428b5cbf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912222130370.28669@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912222130370.28669@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 22, 2009 at 1:30 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Move the kfree after the iounmap that refers to the same structure.
>

Thanks Julia.  I'll apply this one and the kzalloc versus memset one
you sent earlier.

--
Dan
