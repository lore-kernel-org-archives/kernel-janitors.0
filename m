From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 May 2015 21:36:44 +0000
Subject: [PATCH 0/2] staging: lustre: cl_page: drop unneeded variable and macros
Message-Id: <1431121006-23857-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Drop an unneeded variable in
drivers/staging/lustre/lustre/obdclass/cl_page.c and then drop a set of
empty macros.

