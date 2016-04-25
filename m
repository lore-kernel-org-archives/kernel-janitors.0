From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 25 Apr 2016 13:19:57 +0000
Subject: Re: device property: fix for a case of use-after-free
Message-Id: <20160425131957.GA26200@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160425113408.GA6175@mwanda>
In-Reply-To: <20160425113408.GA6175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Apr 25, 2016 at 02:34:08PM +0300, Dan Carpenter wrote:
> Hi Heikki Krogerus,
> 
> The patch 0d67e0fa1664: "device property: fix for a case of
> use-after-free" from Mar 10, 2016, has an issue.
> 
> Assume "fwnode" is an ERR_PTR>
> 
> drivers/base/property.c
>    204  static bool __fwnode_property_present(struct fwnode_handle *fwnode,
>    205                                        const char *propname)
>    206  {
>    207          if (is_of_node(fwnode))
>                                ^^^^^^
> We dereference it here.

Hmm. It looks like that function also just checks fwnode and not
IS_ERR_OR_NULL(fwnode)..

>    208                  return of_property_read_bool(to_of_node(fwnode), propname);
>    209          else if (is_acpi_node(fwnode))
>    210                  return !acpi_node_prop_get(fwnode, propname, NULL);
>    211          else if (is_pset_node(fwnode))
>    212                  return !!pset_prop_get(to_pset_node(fwnode), propname);
>    213          return false;
> 
> Some of these depend on the .config but I don't see a path through this
> function where fwnode can be an ERR_PTR and we don't oops.
> 
>    214  }
>    215  
>    216  /**
>    217   * fwnode_property_present - check if a property of a firmware node is present
>    218   * @fwnode: Firmware node whose property to check
>    219   * @propname: Name of the property
>    220   */
>    221  bool fwnode_property_present(struct fwnode_handle *fwnode, const char *propname)
>    222  {
>    223          bool ret;
>    224  
>    225          ret = __fwnode_property_present(fwnode, propname);
>                                                 ^^^^^^^
> We oops here.
> 
>    226          if (ret = false && !IS_ERR_OR_NULL(fwnode) &&
>                                      ^^^^^^^^^^^^^^^^^^^^^^
> This check for IS_ERR is too late because we already oopsed on the line
> before.
> 
>    227              !IS_ERR_OR_NULL(fwnode->secondary))
>    228                  ret = __fwnode_property_present(fwnode->secondary, propname);
>    229          return ret;
>    230  }

Does this fix the issue for you? I noticed that the other types don't
check it any more then of:


diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9b1a65d..7f692ac 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -21,7 +21,7 @@
 
 static inline bool is_pset_node(struct fwnode_handle *fwnode)
 {
-       return fwnode && fwnode->type = FWNODE_PDATA;
+       return !IS_ERR_OR_NULL(fwnode) && fwnode->type = FWNODE_PDATA;
 }
 
 static inline struct property_set *to_pset_node(struct fwnode_handle *fwnode)
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 14362a8..3a93250 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -394,13 +394,13 @@ struct acpi_data_node {
 
 static inline bool is_acpi_node(struct fwnode_handle *fwnode)
 {
-       return fwnode && (fwnode->type = FWNODE_ACPI
+       return !IS_ERR_OR_NULL(fwnode) && (fwnode->type = FWNODE_ACPI
                || fwnode->type = FWNODE_ACPI_DATA);
 }
 
 static inline bool is_acpi_device_node(struct fwnode_handle *fwnode)
 {
-       return fwnode && fwnode->type = FWNODE_ACPI;
+       return !IS_ERR_OR_NULL(fwnode) && fwnode->type = FWNODE_ACPI;
 }
 
 static inline struct acpi_device *to_acpi_device_node(struct fwnode_handle *fwnode)
diff --git a/include/linux/of.h b/include/linux/of.h
index 7fcb681..3175803 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -133,7 +133,7 @@ void of_core_init(void);
 
 static inline bool is_of_node(struct fwnode_handle *fwnode)
 {
-       return fwnode && fwnode->type = FWNODE_OF;
+       return !IS_ERR_OR_NULL(fwnode) && fwnode->type = FWNODE_OF;
 }
 
 static inline struct device_node *to_of_node(struct fwnode_handle *fwnode)


Thanks,

-- 
heikki
