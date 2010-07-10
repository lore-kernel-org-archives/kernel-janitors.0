From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 10:54:29 +0000
Subject: [patch] cgroups: save space for the terminator
Message-Id: <20100710105429.GW19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Menage <menage@google.com>
Cc: Li Zefan <lizf@cn.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Ben Blum <bblum@andrew.cmu.edu>, containers@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code didn't leave enough space for a NULL terminator.
These strings are copied with strcpy() into fixed length buffers in
cgroup_root_from_opts().
 
Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/cgroup.c b/kernel/cgroup.c
index 3ac6f5b..a942820 100644
--- a/kernel/cgroup.c
+++ b/kernel/cgroup.c
@@ -1102,7 +1102,7 @@ static int parse_cgroupfs_options(char *data, struct cgroup_sb_opts *opts)
 			if (opts->release_agent)
 				return -EINVAL;
 			opts->release_agent -				kstrndup(token + 14, PATH_MAX, GFP_KERNEL);
+				kstrndup(token + 14, PATH_MAX - 1, GFP_KERNEL);
 			if (!opts->release_agent)
 				return -ENOMEM;
 		} else if (!strncmp(token, "name=", 5)) {
@@ -1123,7 +1123,7 @@ static int parse_cgroupfs_options(char *data, struct cgroup_sb_opts *opts)
 			if (opts->name)
 				return -EINVAL;
 			opts->name = kstrndup(name,
-					      MAX_CGROUP_ROOT_NAMELEN,
+					      MAX_CGROUP_ROOT_NAMELEN - 1,
 					      GFP_KERNEL);
 			if (!opts->name)
 				return -ENOMEM;
