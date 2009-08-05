From: Kyle McMartin <kyle@mcmartin.ca>
Date: Wed, 05 Aug 2009 14:57:13 +0000
Subject: Re: [PATCH] arch/parisc: correct use of SHF_ALLOC
Message-Id: <20090805145713.GP28572@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908042226231.3737@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 04, 2009 at 10:27:07PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> SHF_ALLOC is suitable for testing against the sh_flags field, not the
> sh_type field.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 

Thanks Julia, applied.
