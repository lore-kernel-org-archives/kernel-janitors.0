From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Feb 2016 07:47:10 +0000
Subject: [patch] drm/amd: cleanup get_mfd_cell_dev()
Message-Id: <20160225074709.GA7333@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Murali Krishna Vemuri <murali-krishna.vemuri@amd.com>

It's simpler to just use snprintf() to print this to one buffer instead
of using strcpy() and strcat().  Also using snprintf() is slightly safer
than using sprintf().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 9f8cfaa..d6b0bff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -240,12 +240,10 @@ static int acp_poweron(struct generic_pm_domain *genpd)
 static struct device *get_mfd_cell_dev(const char *device_name, int r)
 {
 	char auto_dev_name[25];
-	char buf[8];
 	struct device *dev;
 
-	sprintf(buf, ".%d.auto", r);
-	strcpy(auto_dev_name, device_name);
-	strcat(auto_dev_name, buf);
+	snprintf(auto_dev_name, sizeof(auto_dev_name),
+		 "%s.%d.auto", device_name, r);
 	dev = bus_find_device_by_name(&platform_bus_type, NULL, auto_dev_name);
 	dev_info(dev, "device %s added to pm domain\n", auto_dev_name);
 
