From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 02 Jun 2004 17:28:16 +0000
Subject: [Kernel-janitors] [PATCH] - Creates a dir for CPU sched docs in
Message-Id: <20040602172815.GB1767@tirion.prodam>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41152616143326637=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41152616143326637==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


 Hi,

 In Documentation/ there is three documents about the
CPU scheduler (sched-coding.txt, sched-design.txt, sched-domain.txt).

 What about create a new dir (called cpu-sched) for then ?

 The patch is here:

[33K]
http://www.telecentros.sp.gov.br/phpwiki/dev/patches/document-cpu-sched-dir.patch


 Documentation/cpu-sched/sched-coding.txt  |  126 ++++++++++++++++++++++
 Documentation/cpu-sched/sched-design.txt  |  165 ++++++++++++++++++++++++++++++
 Documentation/cpu-sched/sched-domains.txt |   55 ++++++++++
 Documentation/sched-coding.txt            |  126 ----------------------
 Documentation/sched-design.txt            |  165 ------------------------------
 Documentation/sched-domains.txt           |   55 ----------
 6 files changed, 346 insertions(+), 346 deletions(-)

-- 
Luiz Fernando N. Capitulino
<http://www.telecentros.sp.gov.br>

--===============41152616143326637==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41152616143326637==--
