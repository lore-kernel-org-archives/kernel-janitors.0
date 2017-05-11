From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 May 2017 08:49:55 +0000
Subject: [bug report] tee: add OP-TEE driver
Message-Id: <20170511084955.kazkfvsx5r33e6wg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jens Wiklander,

The patch 4fb0a5eb364d: "tee: add OP-TEE driver" from Apr 14, 2015,
leads to the following static checker warning:

	drivers/tee/optee/core.c:243 optee_release()
	error: uninitialized symbol 'parg'.

drivers/tee/optee/core.c
   209  static void optee_release(struct tee_context *ctx)
   210  {
   211          struct optee_context_data *ctxdata = ctx->data;
   212          struct tee_device *teedev = ctx->teedev;
   213          struct optee *optee = tee_get_drvdata(teedev);
   214          struct tee_shm *shm;
   215          struct optee_msg_arg *arg = NULL;
   216          phys_addr_t parg;
   217          struct optee_session *sess;
   218          struct optee_session *sess_tmp;
   219  
   220          if (!ctxdata)
   221                  return;
   222  
   223          shm = tee_shm_alloc(ctx, sizeof(struct optee_msg_arg), TEE_SHM_MAPPED);
   224          if (!IS_ERR(shm)) {
   225                  arg = tee_shm_get_va(shm, 0);
   226                  /*
   227                   * If va2pa fails for some reason, we can't call
   228                   * optee_close_session(), only free the memory. Secure OS
   229                   * will leak sessions and finally refuse more sessions, but
   230                   * we will at least let normal world reclaim its memory.
   231                   */
   232                  if (!IS_ERR(arg))
   233                          tee_shm_va2pa(shm, arg, &parg);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This function can fail but we don't check for that.

   234          }
   235  
   236          list_for_each_entry_safe(sess, sess_tmp, &ctxdata->sess_list,
   237                                   list_node) {
   238                  list_del(&sess->list_node);
   239                  if (!IS_ERR_OR_NULL(arg)) {
   240                          memset(arg, 0, sizeof(*arg));
   241                          arg->cmd = OPTEE_MSG_CMD_CLOSE_SESSION;
   242                          arg->session = sess->session_id;
   243                          optee_do_call_with_arg(ctx, parg);
                                                            ^^^^
Warning.

   244                  }
   245                  kfree(sess);
   246          }
   247          kfree(ctxdata);

regards,
dan carpenter
