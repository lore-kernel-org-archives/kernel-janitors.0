From: Julia Lawall <julia@diku.dk>
Date: Sun, 05 Sep 2010 18:59:52 +0000
Subject: [PATCH 7/8] drivers/i2c/busses/i2c-amd8111.c: Fix unsigned return type
Message-Id: <1283713226-8429-8-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In each case, the function has an unsigned return type, but returns a
negative constant to indicate an error condition.  The result of calling
the function is always stored in a variable of type (signed) int, and thus
unsigned can be dropped from the return type.

A sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@exists@
identifier f;
constant C;
@@

 unsigned f(...)
 { <+...
*  return -C;
 ...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/i2c/busses/i2c-amd8111.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
index af1e5e2..02a3726 100644
--- a/drivers/i2c/busses/i2c-amd8111.c
+++ b/drivers/i2c/busses/i2c-amd8111.c
@@ -69,7 +69,7 @@ static struct pci_driver amd8111_driver;
  * ACPI 2.0 chapter 13 access of registers of the EC
  */
 
-static unsigned int amd_ec_wait_write(struct amd_smbus *smbus)
+static int amd_ec_wait_write(struct amd_smbus *smbus)
 {
 	int timeout = 500;
 
@@ -85,7 +85,7 @@ static unsigned int amd_ec_wait_write(struct amd_smbus *smbus)
 	return 0;
 }
 
-static unsigned int amd_ec_wait_read(struct amd_smbus *smbus)
+static int amd_ec_wait_read(struct amd_smbus *smbus)
 {
 	int timeout = 500;
 

