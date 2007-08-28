From: Yoann Padioleau <padator@wanadoo.fr>
Date: Tue, 28 Aug 2007 17:58:13 +0000
Subject: miss list_del(), bug ?
Message-Id: <874pij8rt6.fsf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org


Shouldn't this code also do a list_del(e) ? 

in drivers/infiniband/core/iwcm.c:

static void dealloc_work_entries(struct iwcm_id_private *cm_id_priv)
{
	struct list_head *e, *tmp;

	list_for_each_safe(e, tmp, &cm_id_priv->work_free_list)
		kfree(list_entry(e, struct iwcm_work, free_list));
}

