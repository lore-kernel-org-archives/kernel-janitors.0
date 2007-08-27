From: Yoann Padioleau <padator@wanadoo.fr>
Date: Mon, 27 Aug 2007 17:21:30 +0000
Subject: [bug?] miss list_del
Message-Id: <871wdooput.fsf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Shouldn't this code also do a list_del(e) ? 


in drivers/infiniband/core/iwcm.c:

static void dealloc_work_entries(struct iwcm_id_private *cm_id_priv)
{
	struct list_head *e, *tmp;

	list_for_each_safe(e, tmp, &cm_id_priv->work_free_list)
		kfree(list_entry(e, struct iwcm_work, free_list));
}




