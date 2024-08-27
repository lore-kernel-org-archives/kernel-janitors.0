Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD4823DF
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724789923; cv=none; b=gyIwNLqovRzlLNdnqxqpNI74pMZDV/1KqYxTFvpD6JmcbRt6ulKlHc6eWoK2yvTbuqGGokp26oy1bMeZIKbkBFXh3yoXZ7xlN8IwAQSQtEEWSa71YlAA0jNj2aTj3hq8ipFkRZvooRzxAicnwzMmbd4giGuJBoiL7eFvm7U98GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724789923; c=relaxed/simple;
	bh=CMk9VLluRmVBMSP5zzMy8cj269TClvuPP3UKAMHEjmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAxtmyjaShxY78Z15yi6fc1HxoWFViUYyxQ5fBfX9LZ1d4sW22d9q6WHS7wxdCSWP25dM3Dn0iBer0uhuilu1/9JSQ0noPUMizFcdfb3mV7ZLNwRg5k89uk99sYbMKzE5StoK20Udfy+Tgo7rz3elyJkaskZzZb/B/lKNPlx4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhDQJUd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhDQJUd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D93C4AF09;
	Tue, 27 Aug 2024 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724789923;
	bh=CMk9VLluRmVBMSP5zzMy8cj269TClvuPP3UKAMHEjmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhDQJUd5JwnjQKNQtWC6I5++yCC5lxeWYU6FUpDN/gwxMkrQuFbD4Wk7LLL40f7G0
	 hTNNVqivFqk1ngCtForAl4/mV8fupPwqIQC/Kq9CNTF//tChwiCFw99a2FmsI0zklC
	 RpFIJ1i+7dXak2UrCNDgLoMHmaSKZMvf4/WS5xcZNoAy1+tgC5BlqzmMZuJNwSYDCA
	 8Zlphx3VMGmiz0tyqySAahN2GwqpOc0CjT+5qX4VM8q77fsYjmiWtKl4r7FgR21mmX
	 lQz3sbypKr1fS+YjNLQgG60EOgc3tjVMHd0J8z7GTVMbuotcABvJCIpCSpGSr6/UAb
	 4MvKXwxpWkKQw==
Date: Tue, 27 Aug 2024 10:18:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org
Subject: [PATCH sched_ext/for-6.12] scx_central: Fix smatch checker warning
Message-ID: <Zs40ohQdpRJ5uMD5@slm.duckdns.org>
References: <955e1c3c-ace2-4a1d-b246-15b8196038a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <955e1c3c-ace2-4a1d-b246-15b8196038a3@stanley.mountain>

ARRAY_ELEM_PTR() is an access macro used to help the BPF verifier not
confused by offseted memory acceeses by yiedling a valid pointer or NULL in
a way that's clear to the verifier. As such, the canonical usage involves
checking NULL return from the macro. Note that in many cases, the NULL
condition can never happen - they're there just to hint the verifier.

In a bpf_loop in scx_central.bpf.c::central_dispatch(), the NULL check was
incorrect in that there was another dereference of the pointer in addition
to the NULL checked access. This worked as the pointer can never be NULL and
the verifier could tell it would never be NULL in this case.

However, this still looks wrong and trips smatch:

  ./tools/sched_ext/scx_central.bpf.c:205 ____central_dispatch()
  error: we previously assumed 'gimme' could be null (see line 201)

  ./tools/sched_ext/scx_central.bpf.c
      195
      196                         if (!scx_bpf_dispatch_nr_slots())
      197                                 break;
      198
      199                         /* central's gimme is never set */
      200                         gimme = ARRAY_ELEM_PTR(cpu_gimme_task, cpu, nr_cpu_ids);
      201                         if (gimme && !*gimme)
				      ^^^^^
  If gimme is NULL

      202                                 continue;
      203
      204                         if (dispatch_to_cpu(cpu))
  --> 205                                 *gimme = false;

Fix the NULL check so that there are no derefs if NULL. This doesn't change
actual behavior.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: http://lkml.kernel.org/r/<955e1c3c-ace2-4a1d-b246-15b8196038a3@stanley.mountain>
---
Aplying to sched_ext/for-6.12.

Thanks.

 tools/sched_ext/scx_central.bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sched_ext/scx_central.bpf.c b/tools/sched_ext/scx_central.bpf.c
index 1d8fd570eaa7..8dd8eb73b6b8 100644
--- a/tools/sched_ext/scx_central.bpf.c
+++ b/tools/sched_ext/scx_central.bpf.c
@@ -198,7 +198,7 @@ void BPF_STRUCT_OPS(central_dispatch, s32 cpu, struct task_struct *prev)
 
 			/* central's gimme is never set */
 			gimme = ARRAY_ELEM_PTR(cpu_gimme_task, cpu, nr_cpu_ids);
-			if (gimme && !*gimme)
+			if (!gimme || !*gimme)
 				continue;
 
 			if (dispatch_to_cpu(cpu))
-- 
2.46.0

