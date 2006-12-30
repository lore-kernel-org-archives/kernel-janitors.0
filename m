From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Sat, 30 Dec 2006 17:07:51 +0000
Subject: [KJ] ok to replace with memcmp?
Message-Id: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello friends!

I believe it should be possible to replace the code below with memcmp.
According to the comments, memcmp is not good in this case but I
believe it is. The code compares the data in 'key1' and 'key2', and
that is what memcmp is for. Do you have any comments?

I haven't actually tested my change.

Original code (net/core/flow.c):

/* I hear what you're saying, use memcmp.  But memcmp cannot make
 * important assumptions that we can here, such as alignment and
 * constant size.
 */
static int flow_key_compare(struct flowi *key1, struct flowi *key2)
{
	flow_compare_t *k1, *k1_lim, *k2;
	const int n_elem = sizeof(struct flowi) / sizeof(flow_compare_t);

	if (sizeof(struct flowi) % sizeof(flow_compare_t))
		flowi_is_missized();

	k1 = (flow_compare_t *) key1;
	k1_lim = k1 + n_elem;

	k2 = (flow_compare_t *) key2;

	do {
		if (*k1++ != *k2++)
			return 1;
	} while (k1 < k1_lim);

	return 0;
}


Suggested code:

static int flow_key_compare(struct flowi *key1, struct flowi *key2)
{
	if (sizeof(struct flowi) % sizeof(flow_compare_t))
		flowi_is_missized();

	/* Compare the elements in key1 and key2.
	 * Number of elements to compare:
	 *     n_elem = sizeof(flowi) / sizeof(flow_compare_t)
	 * Number of bytes to compare:
	 *     sz = n_elem * sizeof(flow_compare_t)
	 */
	return memcmp(key1, key2, (sizeof(struct flowi) /
sizeof(flow_compare_t)) * sizeof(flow_compare_t));
}

Best regards,
Daniel
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
