From: Jiri Pirko <jpirko@redhat.com>
Date: Wed, 14 Dec 2011 07:34:47 +0000
Subject: Re: [patch] vlan: add rtnl_dereference() annotations
Message-Id: <20111214073446.GA2092@minipsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111214062943.GD7499@elgon.mountain>
In-Reply-To: <20111214062943.GD7499@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Dec 14, 2011 at 07:29:43AM CET, dan.carpenter@oracle.com wrote:
>The original code generates a Sparse warning:
>net/8021q/vlan_core.c:336:9:
>	error: incompatible types in comparison expression (different address spaces)
>
>It's ok to dereference __rcu pointers here because we are holding the
>RTNL lock.  I've added some calls to rtnl_dereference() to silence the
>warning.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
>I haven't tested this, and I'm not super familiar with this code.
>Please review it carefully.
>
>diff --git a/net/8021q/vlan_core.c b/net/8021q/vlan_core.c
>index 1414c93..4d39d80 100644
>--- a/net/8021q/vlan_core.c
>+++ b/net/8021q/vlan_core.c
>@@ -326,14 +326,16 @@ int vlan_vids_add_by_dev(struct net_device *dev,
> 			 const struct net_device *by_dev)
> {
> 	struct vlan_vid_info *vid_info;
>+	struct vlan_info *vlan_info;
> 	int err;
> 
> 	ASSERT_RTNL();
> 
>-	if (!by_dev->vlan_info)
>+	vlan_info = rtnl_dereference(by_dev->vlan_info);
>+	if (!vlan_info)
> 		return 0;
> 
>-	list_for_each_entry(vid_info, &by_dev->vlan_info->vid_list, list) {
>+	list_for_each_entry(vid_info, &vlan_info->vid_list, list) {
> 		err = vlan_vid_add(dev, vid_info->vid);
> 		if (err)
> 			goto unwind;
>@@ -342,7 +344,7 @@ int vlan_vids_add_by_dev(struct net_device *dev,
> 
> unwind:
> 	list_for_each_entry_continue_reverse(vid_info,
>-					     &by_dev->vlan_info->vid_list,
>+					     &vlan_info->vid_list,
> 					     list) {
> 		vlan_vid_del(dev, vid_info->vid);
> 	}
>@@ -355,13 +357,15 @@ void vlan_vids_del_by_dev(struct net_device *dev,
> 			  const struct net_device *by_dev)
> {
> 	struct vlan_vid_info *vid_info;
>+	struct vlan_info *vlan_info;
> 
> 	ASSERT_RTNL();
> 
>-	if (!by_dev->vlan_info)
>+	vlan_info = rtnl_dereference(by_dev->vlan_info);
>+	if (!vlan_info)
> 		return;
> 
>-	list_for_each_entry(vid_info, &by_dev->vlan_info->vid_list, list)
>+	list_for_each_entry(vid_info, &vlan_info->vid_list, list)
> 		vlan_vid_del(dev, vid_info->vid);
> }
> EXPORT_SYMBOL(vlan_vids_del_by_dev);


Acked-by: Jiri Pirko <jpirko@redhat.com>


Thanks Dan!
