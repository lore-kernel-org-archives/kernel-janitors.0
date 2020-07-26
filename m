From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 10:58:26 +0000
Subject: [PATCH 1/7] ASoC: Intel: drop unnecessary list_empty
Message-Id: <1595761112-11003-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

list_for_each_entry_safe is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

Note that list_for_each_entry_safe is defined in terms of
list_first_entry, which indicates that it should not be used on an
empty list.  But in list_for_each_entry_safe, the element obtained by
list_first_entry is not really accessed, only the address of its
list_head field is compared to the address of the list head, so the
list_first_entry is safe.

The semantic patch that makes this change is as follows (with another
variant for the no brace case): (http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_entry_safe;
statement S;
identifier i,j;
@@
-if (!(list_empty(x))) {
   list_for_each_entry_safe(i,j,x,...) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/intel/atom/sst/sst_loader.c  |   10 ++++------
 sound/soc/intel/skylake/skl-pcm.c      |    8 +++-----
 sound/soc/intel/skylake/skl-topology.c |    5 ++---
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index 8ad0ca7..fc91a30 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -276,12 +276,10 @@ void sst_memcpy_free_resources(struct intel_sst_drv *sst_drv_ctx)
 	struct sst_memcpy_list *listnode, *tmplistnode;
 
 	/* Free the list */
-	if (!list_empty(&sst_drv_ctx->memcpy_list)) {
-		list_for_each_entry_safe(listnode, tmplistnode,
-				&sst_drv_ctx->memcpy_list, memcpylist) {
-			list_del(&listnode->memcpylist);
-			kfree(listnode);
-		}
+	list_for_each_entry_safe(listnode, tmplistnode,
+				 &sst_drv_ctx->memcpy_list, memcpylist) {
+		list_del(&listnode->memcpylist);
+		kfree(listnode);
 	}
 }
 
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 89dcccd..9e15b06 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1509,11 +1509,9 @@ int skl_platform_unregister(struct device *dev)
 	struct skl_dev *skl = bus_to_skl(bus);
 	struct skl_module_deferred_bind *modules, *tmp;
 
-	if (!list_empty(&skl->bind_list)) {
-		list_for_each_entry_safe(modules, tmp, &skl->bind_list, node) {
-			list_del(&modules->node);
-			kfree(modules);
-		}
+	list_for_each_entry_safe(modules, tmp, &skl->bind_list, node) {
+		list_del(&modules->node);
+		kfree(modules);
 	}
 
 	kfree(skl->dais);
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b9aab47..b7d2d97 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3773,9 +3773,8 @@ void skl_tplg_exit(struct snd_soc_component *component, struct hdac_bus *bus)
 	struct skl_dev *skl = bus_to_skl(bus);
 	struct skl_pipeline *ppl, *tmp;
 
-	if (!list_empty(&skl->ppl_list))
-		list_for_each_entry_safe(ppl, tmp, &skl->ppl_list, node)
-			list_del(&ppl->node);
+	list_for_each_entry_safe(ppl, tmp, &skl->ppl_list, node)
+		list_del(&ppl->node);
 
 	/* clean up topology */
 	snd_soc_tplg_component_remove(component, SND_SOC_TPLG_INDEX_ALL);
