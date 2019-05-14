From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 May 2019 21:08:46 +0000
Subject: [bug report] platform/chrome: Add ChromeOS EC ISHTP driver
Message-Id: <20190514210846.GA6848@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rushikesh S Kadam,

The patch 4f346361cf42: "platform/chrome: Add ChromeOS EC ISHTP
driver" from May 4, 2019, leads to the following static checker
warning:

drivers/platform/chrome/cros_ec_ishtp.c:527 cros_ec_pkt_xfer_ish()
warn: inconsistent returns 'read_sem:&init_lock'.
  Locked on:   line 475
               line 482
  Unlocked on: line 467
               line 527

drivers/platform/chrome/cros_ec_ishtp.c
   450  static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
   451                                  struct cros_ec_command *msg)
   452  {
   453          int rv;
   454          struct ishtp_cl *cros_ish_cl = ec_dev->priv;
   455          struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
   456          struct device *dev = cl_data_to_dev(client_data);
   457          struct cros_ish_in_msg *in_msg = (struct cros_ish_in_msg *)ec_dev->din;
   458          struct cros_ish_out_msg *out_msg    459                  (struct cros_ish_out_msg *)ec_dev->dout;
   460          size_t in_size = sizeof(struct cros_ish_in_msg) + msg->insize;
   461          size_t out_size = sizeof(struct cros_ish_out_msg) + msg->outsize;
   462  
   463          /* Proceed only if reset-init is not in progress */
   464          if (!down_read_trylock(&init_lock)) {
   465                  dev_warn(dev,
   466                           "Host is not ready to send messages to ISH. Try again\n");
   467                  return -EAGAIN;
   468          }
   469  
   470          /* Sanity checks */
   471          if (in_size > ec_dev->din_size) {
   472                  dev_err(dev,
   473                          "Incoming payload size %zu is too large for ec_dev->din_size %d\n",
   474                          in_size, ec_dev->din_size);
   475                  return -EMSGSIZE;
                        ^^^^^^^^^^^^^^^^^
   476          }
   477  
   478          if (out_size > ec_dev->dout_size) {
   479                  dev_err(dev,
   480                          "Outgoing payload size %zu is too large for ec_dev->dout_size %d\n",
   481                          out_size, ec_dev->dout_size);
   482                  return -EMSGSIZE;
                        ^^^^^^^^^^^^^^^^^
Could we move these sanity checks to before we take the lock?  Otherwise
we need to goto end_error;

   483          }
   484  
   485          /* Prepare the package to be sent over ISH TP */
   486          out_msg->hdr.channel = CROS_EC_COMMAND;
   487          out_msg->hdr.status = 0;
   488  
   489          ec_dev->dout += OUT_MSG_EC_REQUEST_PREAMBLE;
   490          cros_ec_prepare_tx(ec_dev, msg);
   491          ec_dev->dout -= OUT_MSG_EC_REQUEST_PREAMBLE;
   492  
   493          dev_dbg(dev,
   494                  "out_msg: struct_ver=0x%x checksum=0x%x command=0x%x command_ver=0x%x data_len=0x%x\n",
   495                  out_msg->ec_request.struct_version,
   496                  out_msg->ec_request.checksum,
   497                  out_msg->ec_request.command,
   498                  out_msg->ec_request.command_version,
   499                  out_msg->ec_request.data_len);
   500  
   501          /* Send command to ISH EC firmware and read response */
   502          rv = ish_send(client_data,
   503                        (u8 *)out_msg, out_size,
   504                        (u8 *)in_msg, in_size);
   505          if (rv < 0)
   506                  goto end_error;
   507  
   508          rv = prepare_cros_ec_rx(ec_dev, in_msg, msg);
   509          if (rv)
   510                  goto end_error;
   511  
   512          rv = in_msg->ec_response.data_len;
   513  
   514          dev_dbg(dev,
   515                  "in_msg: struct_ver=0x%x checksum=0x%x result=0x%x data_len=0x%x\n",
   516                  in_msg->ec_response.struct_version,
   517                  in_msg->ec_response.checksum,
   518                  in_msg->ec_response.result,
   519                  in_msg->ec_response.data_len);
   520  
   521  end_error:
   522          if (msg->command = EC_CMD_REBOOT_EC)
   523                  msleep(EC_REBOOT_DELAY_MS);
   524  
   525          up_read(&init_lock);
   526  
   527          return rv;
   528  }

regards,
dan carpenter
