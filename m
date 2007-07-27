From: Al Viro <viro@ftp.linux.org.uk>
Date: Fri, 27 Jul 2007 10:40:41 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <20070727104041.GW27237@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <20070727100004.GV27237@ftp.linux.org.uk> <87hcnq9mf2.fsf@wanadoo.fr>
In-Reply-To: <87hcnq9mf2.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, dhowells@redhat.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 12:21:53PM +0200, Yoann Padioleau wrote:
> > On Fri, Jul 27, 2007 at 11:44:35AM +0200, Yoann Padioleau wrote:
> >>  	pte = pte_alloc_kernel(pme, va);
> >> -	if (pte != 0) {
> >> +	if (pte != NULL) {
 
> I don't understand. pte is a pointer right ? So why should we
> keep the = 0 ? 

Idiomatic form for "has allocation succeeded?" is neither "if (p != 0)" nor
"if (p != NULL)".  It's simply "if (p)".

Note that it depends upon context.  For something that combines assignment
with test
	if ((p = foo_alloc()) != NULL)
would be the right way to go.  Ditto for
	flag = (p = NULL)
(alternative would be "flag = !p", which is usually not nice or even
"flag = !!p" for the opposite test, and that's bloody atrocious).

For places like
-      if (spu_disassemble_table[o] = 0)
+      if (spu_disassemble_table[o] = NULL)
        spu_disassemble_table[o] = &spu_opcodes[i];
it's a matter of taste; there I'd go for explicit comparison with NULL.
I'd also go for explicit comparisons in places like
-               wait_event(journal->j_wait_done_commit, journal->j_task = 0);
+               wait_event(journal->j_wait_done_commit, journal->j_task = NULL);
