From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 Aug 2010 16:28:52 +0000
Subject: [PATCH 15/16] drivers/platform/x86: Use available error codes
Message-Id: <Pine.LNX.4.64.1008161828350.19313@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

An error code is stored in the variable error, but it is the variable
result that is returned instead.  So store the error code in result.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
local idexpression x;
constant C;
@@

if (...) { ...
  x = -C
  ... when != x
(
  return <+...x...+>;
|
  return NULL;
|
  return;
|
* return ...;
)
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics and has not been tested.  In each case, error is
also assigned to the result of a function call.  Perhpas that should be
changed to result as well, and error should be eliminated.

 drivers/platform/x86/fujitsu-laptop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f44cd26..e7d2259 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -668,7 +668,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 
 	fujitsu->input = input = input_allocate_device();
 	if (!input) {
-		error = -ENOMEM;
+		result = -ENOMEM;
 		goto err_stop;
 	}
 
@@ -833,7 +833,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 
 	fujitsu_hotkey->input = input = input_allocate_device();
 	if (!input) {
-		error = -ENOMEM;
+		result = -ENOMEM;
 		goto err_free_fifo;
 	}
 
