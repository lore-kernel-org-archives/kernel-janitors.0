From: Julia Lawall <julia@diku.dk>
Date: Sat, 20 Dec 2008 18:19:13 +0000
Subject: Re: container_of
Message-Id: <Pine.LNX.4.64.0812201918330.6860@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 20 Dec 2008, Darren Jenkins wrote:

> Hello Julia,
> 
> I think pointer signedness is architecture dependant, but I have never
> seen an architecture crazy enough to use signed memory addressing.
> 
> I haven't looked at the associated code (because it is late here and I
> am tired),  but it looks like this bit is just checking if the struct
> is NULL, not the struct member.
> Depending on the associated code, this is probably the sensible thing
> to do, as the memory will be allocated for the struct, so if the
> allocation fails the pointer to the base of the struct will be NULL
> and the pointer to the struct member will be "NULL + offsetof(struct,
> member)" ie probably not null.

OK, I see, good point.

thanks,
julia
