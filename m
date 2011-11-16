From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2011 08:23:10 +0000
Subject: [patch -next] intel_idle: silence a sparse warning
Message-Id: <20111116082309.GB10264@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Sparse complains when you cast ints to a 64 bit pointer so I've made
this function return a long instead of an int.  Here is the Sparse
warning:

drivers/idle/intel_idle.c: In function ‘intel_idle_cpuidle_devices_init’:
drivers/idle/intel_idle.c:525:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index 38da9f8..2f38391 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -197,7 +197,7 @@ static struct cpuidle_state atom_cstates[MWAIT_MAX_NUM_CSTATES] = {
 		.enter = &intel_idle },
 };
 
-static int get_driver_data(int cstate)
+static long get_driver_data(int cstate)
 {
 	int driver_data;
 	switch (cstate) {
