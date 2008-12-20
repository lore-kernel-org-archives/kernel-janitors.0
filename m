From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sat, 20 Dec 2008 11:54:56 +0000
Subject: Re: container_of
Message-Id: <82faac5b0812200354j1ea710ecn8f59111eeab133bc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Julia,

I think pointer signedness is architecture dependant, but I have never
seen an architecture crazy enough to use signed memory addressing.

I haven't looked at the associated code (because it is late here and I
am tired),  but it looks like this bit is just checking if the struct
is NULL, not the struct member.
Depending on the associated code, this is probably the sensible thing
to do, as the memory will be allocated for the struct, so if the
allocation fails the pointer to the base of the struct will be NULL
and the pointer to the struct member will be "NULL + offsetof(struct,
member)" ie probably not null.



On Sat, Dec 20, 2008 at 4:56 AM, Julia Lawall <julia@diku.dk> wrote:
> Considering code such as the following (drivers/acpi/osl.c):
>
>        struct acpi_os_dpc *dpc = container_of(work, struct acpi_os_dpc, work);
>        if (!dpc) {
>                printk(KERN_ERR PREFIX "Invalid (NULL) context\n");
>                return;
>        }
>
> Is it very likely that container_of can return NULL?  Container_of
> computes an offset from a pointer, so I have the impression that if given
> a NULL value it would normally return a negative number (or a very large
> positive one, depending on how it is interpreted).
>
> thanks,
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
