From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Feb 2006 05:13:52 +0000
Subject: Re: [KJ] Fwd: libata janitor project
Message-Id: <1139634833.7781.68.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27034664199918468=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
In-Reply-To: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============27034664199918468==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-02-10 at 14:49 +0100, Eric Sesterhenn wrote:

> @@ -2510,11 +2510,11 @@ static void ata_sg_clean(struct ata_queu
>  	int dir = qc->dma_dir;
>  	void *pad_buf = NULL;
>  
> -	assert(qc->flags & ATA_QCFLAG_DMAMAP);
> -	assert(sg != NULL);
> +	WARN_ON(!(qc->flags & ATA_QCFLAG_DMAMAP));
> +	WARN_ON(sg == NULL);
>  
>  	if (qc->flags & ATA_QCFLAG_SINGLE)
> -		assert(qc->n_elem == 1);
> +		WARN_ON(qc->n_elem != 1);
>  
>  	VPRINTK("unmapping %u sg elements\n", qc->n_elem);
>  

Ok now I have had some sleep I have been thinking about this bit some
more. The last bit expands to.

example 1
if (qc->flags & ATA_QCFLAG_SINGLE) 
	if (unlikely((qc->n_elem != 1)!=0) {
		printk("Badness in %s at %s:%d\n", __FUNCTION__, __FILE__, __LINE__);
		dump_stack();
	}

which has two if() tests.

where if you wrote

WARN_ON((qc->flags & ATA_QCFLAG_SINGLE) && qc->n_elem != 1)

it will expand to 

example 2
if (unlikely(((qc->flags & ATA_QCFLAG_SINGLE) && qc->n_elem != 1) != 0 ) {
	printk("Badness in %s at %s:%d\n", __FUNCTION__, __FILE__, __LINE__);
	dump_stack();
}

which has one if () with unlikely wrapped around the result.
I assume in the case of unlikely(test1 && test2) GCC will bail out if
test1 is not true (no I have not checked yet)
before testing test2.
 
So we should have three cases:
1 test1 is false
2 test1 is true test2 is false
3 test1 is true test2 is false 

in case 1 both code examples should be relatively similar.

in case 2 the second code example will evaluate both tests then fail the
if (unlikely ()) so probably no branching

the first code example will evaluate test1 as true and probably branch
to the second test which will fail. So we have an extra branch in the
first code example.

in case 3 the second code example will pass the if (unlikely()) test and
branch to the debug code then jump back.

The first code example will pass the first test and branch to the second
test then pass the second and branch again to the debug code, before
jumping back. So again we have an extra branch in the first code
example.

However;

This all assumes GCC is not smart enough to see what is happening and
optimise the tests itself. I don't know, I am not very familiar with
GCC.

Also the code as it stands might be more readable, as it probably
explains the situation better.

Darren J.


--===============27034664199918468==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27034664199918468==--
