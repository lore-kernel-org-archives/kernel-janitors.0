From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Mon, 22 Jan 2007 16:00:00 +0000
Subject: Re: [KJ] Replacing check_region with request_region
Message-Id: <20070122155959.GC5865@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1169477126.3554.18.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1169477126.3554.18.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 22, 2007 at 08:15:26PM +0530, Vignesh Babu BM wrote:
> Hi,
>   I found the following instances of check_region in the 2.6.20-rc5
> code.
>   I also found that these files also have request_region in some parts.
> So I was just wondering if they were left there for some reason....but
> as part of the deprecated API they have to be removed at some point of
> time right?
>   If they need to be changed then I would go ahead and make a patch.
> Thanks...

From LDD3, Chapter 9:
"Here, the return value is a negative error code if the given ports are not 
available. This function is deprecated because its return value provides no
guarantee of whether an allocation would succeed; checking and later
allocating are not an atomic operation"

I think they should ..

-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
