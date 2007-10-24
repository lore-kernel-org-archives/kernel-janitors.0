From: Mike Miller <mike.miller@hp.com>
Date: Wed, 24 Oct 2007 15:14:58 +0000
Subject: [MAILER-DAEMON@palrel13.hp.com: Undelivered Mail Returned to Sender]
Message-Id: <20071024151458.GB5921@roadking.cca.cpqcorp.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry, I typed in the wrong address first time.

mikem
----- Forwarded message from Mail Delivery System <MAILER-DAEMON@palrel13.hp.com> -----

Date: Tue, 23 Oct 2007 15:21:09 -0700 (PDT)
From: Mail Delivery System <MAILER-DAEMON@palrel13.hp.com>
To: mikem@roadking.cca.cpqcorp.net
Subject: Undelivered Mail Returned to Sender

Content-Description: Notification
This is the Postfix program at host palrel13.hp.com.

I'm sorry to have to inform you that your message could not be
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to <postmaster>

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

			The Postfix program

<linux-janitors@vger.kernel.org>: host vger.kernel.org[209.132.176.167] said:
    554 5.0.0 Hi [156.153.255.238], unresolvable address:
    <linux-janitors@vger.kernel.org>; nosuchuser;
    linux-janitors@vger.kernel.org (in reply to RCPT TO command)

Content-Description: Delivery report
Reporting-MTA: dns; palrel13.hp.com
X-Postfix-Queue-ID: F04EC34D15
X-Postfix-Sender: rfc822; mikem@roadking.cca.cpqcorp.net
Arrival-Date: Tue, 23 Oct 2007 15:01:54 -0700 (PDT)

Final-Recipient: rfc822; linux-janitors@vger.kernel.org
Action: failed
Status: 5.0.0
Diagnostic-Code: X-Postfix; host vger.kernel.org[209.132.176.167] said: 554
    5.0.0 Hi [156.153.255.238], unresolvable address:
    <linux-janitors@vger.kernel.org>; nosuchuser;
    linux-janitors@vger.kernel.org (in reply to RCPT TO command)

Content-Description: Undelivered Message
Date: Tue, 23 Oct 2007 16:54:59 -0500
From: Mike Miller <mike.miller@hp.com>
To: jens.axboe@oracle.com
Cc: linux-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 1/1] cciss: update copyright notices

PATCH 1 of 1

This patch updates the copyright information for the cciss driver. It
includes extending the year to 2007 (how timely) and some minor corrections
deemed necessary by HP legal and the Open Source Review Board. Please
consider this patch for inclusion.

Signed-off-by: Mike Miller <mike.miller@hp.com>
--------------------------------------------------------------------------------
diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index e330c26..cd37e92 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -1,20 +1,20 @@
 /*
- *    Disk Array driver for HP SA 5xxx and 6xxx Controllers
- *    Copyright 2000, 2006 Hewlett-Packard Development Company, L.P.
+ *    Disk Array driver for HP Smart Array controllers.
+ *    (C) Copyright 2000, 2007 Hewlett-Packard Development Company, L.P.
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License as published by
- *    the Free Software Foundation; either version 2 of the License, or
- *    (at your option) any later version.
+ *    the Free Software Foundation; version 2 of the License.
  *
  *    This program is distributed in the hope that it will be useful,
  *    but WITHOUT ANY WARRANTY; without even the implied warranty of
- *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- *    NON INFRINGEMENT.  See the GNU General Public License for more details.
+ *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ *    General Public License for more details.
  *
  *    You should have received a copy of the GNU General Public License
  *    along with this program; if not, write to the Free Software
- *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+ *    02111-1307, USA.
  *
  *    Questions/Comments/Bugfixes to iss_storagedev@hp.com
  *
diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
index 4aca7dd..63ee6c0 100644
--- a/drivers/block/cciss_scsi.c
+++ b/drivers/block/cciss_scsi.c
@@ -1,20 +1,20 @@
 /*
- *    Disk Array driver for Compaq SA53xx Controllers, SCSI Tape module
- *    Copyright 2001 Compaq Computer Corporation
+ *    Disk Array driver for HP Smart Array controllers, SCSI Tape module.
+ *    (C) Copyright 2001, 2007 Hewlett-Packard Development Company, L.P.
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License as published by
- *    the Free Software Foundation; either version 2 of the License, or
- *    (at your option) any later version.
+ *    the Free Software Foundation; version 2 of the License.
  *
  *    This program is distributed in the hope that it will be useful,
  *    but WITHOUT ANY WARRANTY; without even the implied warranty of
- *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- *    NON INFRINGEMENT.  See the GNU General Public License for more details.
+ *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ *    General Public License for more details.
  *
  *    You should have received a copy of the GNU General Public License
  *    along with this program; if not, write to the Free Software
- *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *    Foundation, Inc., 59 Temple Place, Suite 300, Boston, MA
+ *    02111-1307, USA.
  *
  *    Questions/Comments/Bugfixes to iss_storagedev@hp.com
  *    
diff --git a/drivers/block/cciss_scsi.h b/drivers/block/cciss_scsi.h
index 5e7e06c..d9c2c58 100644
--- a/drivers/block/cciss_scsi.h
+++ b/drivers/block/cciss_scsi.h
@@ -1,20 +1,20 @@
 /*
- *    Disk Array driver for Compaq SA53xx Controllers, SCSI Tape module
- *    Copyright 2001 Compaq Computer Corporation
+ *    Disk Array driver for HP Smart Array controllers, SCSI Tape module.
+ *    (C) Copyright 2001, 2007 Hewlett-Packard Development Company, L.P.
  *
  *    This program is free software; you can redistribute it and/or modify
  *    it under the terms of the GNU General Public License as published by
- *    the Free Software Foundation; either version 2 of the License, or
- *    (at your option) any later version.
+ *    the Free Software Foundation; version 2 of the License.
  *
  *    This program is distributed in the hope that it will be useful,
  *    but WITHOUT ANY WARRANTY; without even the implied warranty of
- *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- *    NON INFRINGEMENT.  See the GNU General Public License for more details.
+ *    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ *    General Public License for more details.
  *
  *    You should have received a copy of the GNU General Public License
  *    along with this program; if not, write to the Free Software
- *    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *    Foundation, Inc., 59 Temple Place, Suite 300, Boston, MA
+ *    02111-1307, USA.
  *
  *    Questions/Comments/Bugfixes to iss_storagedev@hp.com
  *


----- End forwarded message -----
