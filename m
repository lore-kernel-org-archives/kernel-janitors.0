From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 05 Nov 2019 21:38:15 +0000
Subject: [PATCH 0/2] CIFS: Adjustments for smb2_ioctl_query_info()
Message-Id: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, Ronnie Sahlberg <lsahlber@redhat.com>Ronnie Sahlberg <lsahlber@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aurelien Aptel <aaptel@suse.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Nov 2019 22:32:23 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user() rather than duplicating its implementation
  Use common error handling code in smb2_ioctl_query_info()

 fs/cifs/smb2ops.c | 58 ++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

--
2.24.0
