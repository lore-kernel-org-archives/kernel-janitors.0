From: walter harms <wharms@bfs.de>
Date: Tue, 14 Dec 2004 18:28:55 +0000
Subject: [KJ] unflow error
Message-Id: <41BF30E7.8070809@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1595248181997464=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1595248181997464==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


in case nobody noticed:

http://isec.pl/vulnerabilities/isec-0018-igmp.txt

so far i understand it the bug caused by a underflow error in
sl_count.

When i compiled 2.6.9 i got several warnings regarding signed/unsigned
comparison. IMHO we should move the issue ontop of the agenda to avoid 
that kind of problems in the future.

re,
walter

ps: i am sorry the mark will leave after such a short time. i hope
he has learned herding cats now :) good luck



--===============1595248181997464==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1595248181997464==--
