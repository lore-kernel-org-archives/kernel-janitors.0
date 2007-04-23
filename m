From: Borislav Petkov <bbpetkov@yahoo.de>
Date: Mon, 23 Apr 2007 07:36:09 +0000
Subject: [KJ] auditing register_netdev()
Message-Id: <20070423073609.GA5698@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi there,

   i've been auditing the return codes of register_netdev() as put in
   http://kernelnewbies.org/KernelJanitors/Todo/ReturnCodes and found one c=
ase
   with the ibm tokenring driver where the return codes weren't acted upon.=
 I
   also sent a patch to the netdev mailing list fixing that so we can strike
   register_netdev() off the above list of TODO's.

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
