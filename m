From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 05 May 2015 05:13:39 +0000
Subject: Re: some advices
Message-Id: <alpine.DEB.2.02.1505050712250.2044@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAPmfwEkA6GZLtmNHno3OYOG31cbDx_5kZpqho4f+KEb75XKGzg@mail.gmail.com>
In-Reply-To: <CAPmfwEkA6GZLtmNHno3OYOG31cbDx_5kZpqho4f+KEb75XKGzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 5 May 2015, Adir Kuhn wrote:

> Hi everybody, I'm quite new here and I want to be a kernel developer
> so where I can start? I dowloaded the linux kernel source and followed
> the tips for the first patch on the kernelnewbies but sometimes these
> patches are not acepted because is too simple (just cleaning code
> style). So there is something else that I can study or some trivial
> bug to fix to feel me more confident on linux development?

It's probably best to avoid changes that affect only whitespace.  Changes 
that make the code more readable, or use more modern APIs may be more 
successful.  If you want to start with whitespace changes, try staging 
code.

julia


> 
> Regards,
> --
> Adir Kuhn
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
