From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2016 10:17:48 +0000
Subject: [patch] drm/amd/powerplay: indent a couple if statements
Message-Id: <20160120101748.GA20143@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Eric Huang <JinHuiEric.Huang@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, Thierry Reding <treding@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Rex Zhu <Rex.Zhu@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently redid the indenting, but missed these two if statements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h b/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
index b7429a5..b10df32 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h
@@ -293,7 +293,7 @@ fInt GetScaledFraction(int X, int factor)
 	}
 
 	if (factor = 1)
-	return (ConvertToFraction(X));
+		return ConvertToFraction(X);
 
 	fValue = fDivide(ConvertToFraction(X * uPow(-1, bNEGATED)), ConvertToFraction(factor));
 
@@ -371,7 +371,7 @@ fInt fDivide (fInt X, fInt Y)
 	fZERO = ConvertToFraction(0);
 
 	if (Equal(Y, fZERO))
-	return fZERO;
+		return fZERO;
 
 	longlongX = (int64_t)X.full;
 	longlongY = (int64_t)Y.full;
