From: Catalin Marinas <catalin.marinas@arm.com>
Date: Thu, 11 Aug 2005 15:08:42 +0000
Subject: [KJ] Re: Kernel Development and Cogito
Message-Id: <tnx3bpgcxz9.fsf@arm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============056178321203491199=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050810202417.GA5387@arthur.home>
In-Reply-To: <20050810202417.GA5387@arthur.home>
To: kernel-janitors@vger.kernel.org

--===============056178321203491199==
Content-Type: text/plain; charset=us-ascii

Gabriel Devenyi <ace@staticwave.ca> wrote:
> I would like to start working on some kernel-janitor stuff, and I've
> cloned Linus' tree using Cogito (cg-clone). My issue is that I can't
> find any documentation on how I would go about working on this tree
> now, like if I make a change, how do I create a patch that I can send
> off to kernel-janitors, and LKML, similarly, how would I reset my tree
> to be exactly like Linus' if I muck something up badly.

Apart from what the others replied, you could also try StGIT if you
used Quilt (it's not complicated at all anyway). Basically, you first
create a patch (or several) and all the modifications are included
into it. You push/pop patches from the top of your tree and also
e-mail them. You can always delete a patch if you no longer need it
and the changes are removed from your tree.

-- 
Catalin


--===============056178321203491199==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============056178321203491199==--
