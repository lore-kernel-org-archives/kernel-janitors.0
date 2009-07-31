From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Date: Fri, 31 Jul 2009 08:54:00 +0000
Subject: [PATCH 1/4] fujitsu-laptop: Correct redundant test
Message-Id: <200907310842.n6V8g0vI006725@mercury.physics.adelaide.edu.au>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org
Cc: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, linux-kernel@vger.kernel.org, julia@diku.dk, bzolnier@gmail.com, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

device and acpi_driver_data(device) were tested just a few lines above.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl> 
@r exists@
local idexpression x;
expression E;
@@

if (x = NULL || ...) { ... when forall
   return ...; }
.. when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>

--- a/drivers/platform/x86/fujitsu-laptop.c	2009-07-31 16:55:09.389775000 +0930
+++ b/drivers/platform/x86/fujitsu-laptop.c	2009-07-31 17:13:01.160777027 +0930
@@ -745,9 +745,6 @@ static int acpi_fujitsu_remove(struct ac
 
 	fujitsu = acpi_driver_data(device);
 
-	if (!device || !acpi_driver_data(device))
-		return -EINVAL;
-
 	fujitsu->acpi_handle = NULL;
 
 	return 0;
