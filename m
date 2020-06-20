From: "luobin (L)" <luobin9@huawei.com>
Date: Sat, 20 Jun 2020 01:26:59 +0000
Subject: Re: [bug report] hinic: add mailbox function support
Message-Id: <189e5546-0268-6619-d806-d2effcefba0b@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619100327.GA245452@mwanda>
In-Reply-To: <20200619100327.GA245452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2020/6/19 18:03, Dan Carpenter wrote:
> Hello Luo bin,
> 
> The patch a425b6e1c69b: "hinic: add mailbox function support" from
> Apr 25, 2020, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c:817 hinic_init_hwdev()
> 	error: passing non negative 65280 to ERR_PTR
> 
> drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
>    716  struct hinic_hwdev *hinic_init_hwdev(struct pci_dev *pdev)
>    717  {
>    718          struct hinic_pfhwdev *pfhwdev;
>    719          struct hinic_hwdev *hwdev;
>    720          struct hinic_hwif *hwif;
>    721          int err, num_aeqs;
>    722  
>    723          hwif = devm_kzalloc(&pdev->dev, sizeof(*hwif), GFP_KERNEL);
>    724          if (!hwif)
>    725                  return ERR_PTR(-ENOMEM);
>    726  
>    727          err = hinic_init_hwif(hwif, pdev);
>    728          if (err) {
>    729                  dev_err(&pdev->dev, "Failed to init HW interface\n");
>    730                  return ERR_PTR(err);
>    731          }
>    732  
>    733          pfhwdev = devm_kzalloc(&pdev->dev, sizeof(*pfhwdev), GFP_KERNEL);
>    734          if (!pfhwdev) {
>    735                  err = -ENOMEM;
>    736                  goto err_pfhwdev_alloc;
>    737          }
>    738  
>    739          hwdev = &pfhwdev->hwdev;
>    740          hwdev->hwif = hwif;
>    741  
>    742          err = init_msix(hwdev);
>    743          if (err) {
>    744                  dev_err(&pdev->dev, "Failed to init msix\n");
>    745                  goto err_init_msix;
>    746          }
>    747  
>    748          err = wait_for_outbound_state(hwdev);
>    749          if (err) {
>    750                  dev_warn(&pdev->dev, "outbound - disabled, try again\n");
>    751                  hinic_outbound_state_set(hwif, HINIC_OUTBOUND_ENABLE);
>    752          }
>    753  
>    754          num_aeqs = HINIC_HWIF_NUM_AEQS(hwif);
>    755  
>    756          err = hinic_aeqs_init(&hwdev->aeqs, hwif, num_aeqs,
>    757                                HINIC_DEFAULT_AEQ_LEN, HINIC_EQ_PAGE_SIZE,
>    758                                hwdev->msix_entries);
>    759          if (err) {
>    760                  dev_err(&pdev->dev, "Failed to init async event queues\n");
>    761                  goto err_aeqs_init;
>    762          }
>    763  
>    764          err = init_pfhwdev(pfhwdev);
>    765          if (err) {
>    766                  dev_err(&pdev->dev, "Failed to init PF HW device\n");
>    767                  goto err_init_pfhwdev;
>    768          }
>    769  
>    770          err = hinic_l2nic_reset(hwdev);
>    771          if (err)
>    772                  goto err_l2nic_reset;
>    773  
>    774          err = get_dev_cap(hwdev);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^
> This function sometimes returns positive values on error which will
> lead to an Oops eventually.
> 
>    775          if (err) {
>    776                  dev_err(&pdev->dev, "Failed to get device capabilities\n");
>    777                  goto err_dev_cap;
>    778          }
>    779  
>    780          err = hinic_vf_func_init(hwdev);
>    781          if (err) {
>    782                  dev_err(&pdev->dev, "Failed to init nic mbox\n");
>    783                  goto err_vf_func_init;
>    784          }
>    785  
>    786          err = init_fw_ctxt(hwdev);
>    787          if (err) {
>    788                  dev_err(&pdev->dev, "Failed to init function table\n");
>    789                  goto err_init_fw_ctxt;
>    790          }
>    791  
>    792          err = set_resources_state(hwdev, HINIC_RES_ACTIVE);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Same here according to Smatch.
> 
>    793          if (err) {
>    794                  dev_err(&pdev->dev, "Failed to set resources state\n");
>    795                  goto err_resources_state;
>    796          }
>    797  
>    798          return hwdev;
>    799  
>    800  err_resources_state:
>    801  err_init_fw_ctxt:
>    802          hinic_vf_func_free(hwdev);
>    803  err_vf_func_init:
>    804  err_l2nic_reset:
>    805  err_dev_cap:
>    806          free_pfhwdev(pfhwdev);
>    807  
>    808  err_init_pfhwdev:
>    809          hinic_aeqs_free(&hwdev->aeqs);
>    810  
>    811  err_aeqs_init:
>    812          disable_msix(hwdev);
>    813  
>    814  err_init_msix:
>    815  err_pfhwdev_alloc:
>    816          hinic_free_hwif(hwif);
>    817          return ERR_PTR(err);
>                                ^^^
> If "err" isn't a negative error code it will lead to an Oops in the
> caller.
> 
>    818  }
> 
> One function which will cause an Oops is mbox_resp_info_handler():
> 
> drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c
>    832  static int mbox_resp_info_handler(struct hinic_mbox_func_to_func *func_to_func,
>    833                                    struct hinic_recv_mbox *mbox_for_resp,
>    834                                    enum hinic_mod_type mod, u16 cmd,
>    835                                    void *buf_out, u16 *out_size)
>    836  {
>    837          int err;
>    838  
>    839          if (mbox_for_resp->msg_info.status) {
>    840                  err = mbox_for_resp->msg_info.status;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>    841                  if (err != HINIC_MBOX_PF_BUSY_ACTIVE_FW)
>    842                          dev_err(&func_to_func->hwif->pdev->dev, "Mbox response error(0x%x)\n",
>    843                                  mbox_for_resp->msg_info.status);
>    844                  return err;
>                                ^^^
> Here err is a u8 so it can't be a negative error code.
> 
>    845          }
>    846  
>    847          if (buf_out && out_size) {
>    848                  if (*out_size < mbox_for_resp->mbox_len) {
>    849                          dev_err(&func_to_func->hwif->pdev->dev,
>    850                                  "Invalid response mbox message length: %d for mod %d cmd %d, should less than: %d\n",
>    851                                  mbox_for_resp->mbox_len, mod, cmd, *out_size);
>    852                          return -EFAULT;
>    853                  }
>    854  
>    855                  if (mbox_for_resp->mbox_len)
>    856                          memcpy(buf_out, mbox_for_resp->mbox,
>    857                                 mbox_for_resp->mbox_len);
>    858  
>    859                  *out_size = mbox_for_resp->mbox_len;
>    860          }
>    861  
>    862          return 0;
>    863  }
> 
> I guess the main problem is functions like send_mbox_seg() which do:
> 
> drivers/net/ethernet/huawei/hinic/hinic_hw_mbox.c
>    662  static int send_mbox_seg(struct hinic_mbox_func_to_func *func_to_func,
>    663                           u64 header, u16 dst_func, void *seg, u16 seg_len,
>    664                           int poll, void *msg_info)
>    665  {
>    666          struct hinic_send_mbox *send_mbox = &func_to_func->send_mbox;
>    667          u16 seq_dir = HINIC_MBOX_HEADER_GET(header, DIRECTION);
>    668          struct hinic_hwdev *hwdev = func_to_func->hwdev;
>    669          struct completion *done = &send_mbox->send_done;
>    670          u8 num_aeqs = hwdev->hwif->attr.num_aeqs;
>    671          u16 dst_aeqn, wb_status = 0, errcode;
>    672  
>    673          if (num_aeqs >= 4)
>    674                  dst_aeqn = (seq_dir = HINIC_HWIF_DIRECT_SEND) ?
>    675                             HINIC_MBOX_RECV_AEQN : HINIC_MBOX_RSP_AEQN;
>    676          else
>    677                  dst_aeqn = 0;
>    678  
>    679          if (!poll)
>    680                  init_completion(done);
>    681  
>    682          clear_mbox_status(send_mbox);
>    683  
>    684          mbox_copy_header(hwdev, send_mbox, &header);
>    685  
>    686          mbox_copy_send_data(hwdev, send_mbox, seg, seg_len);
>    687  
>    688          write_mbox_msg_attr(func_to_func, dst_func, dst_aeqn, seg_len, poll);
>    689  
>    690          wmb(); /* writing the mbox msg attributes */
>    691  
>    692          if (wait_for_mbox_seg_completion(func_to_func, poll, &wb_status))
>    693                  return -ETIMEDOUT;
>    694  
>    695          if (!MBOX_STATUS_SUCCESS(wb_status)) {
>    696                  dev_err(&hwdev->hwif->pdev->dev, "Send mailbox segment to function %d error, wb status: 0x%x\n",
>    697                          dst_func, wb_status);
>    698                  errcode = MBOX_STATUS_ERRCODE(wb_status);
>    699                  return errcode ? errcode : -EFAULT;
>                                          ^^^^^^^
> Positive error code leads to Oops.
> 
>    700          }
>    701  
>    702          return 0;
>    703  }
> 
> I'm not sure if that's every problem, but it's a start.  ;)
> 
> regards,
> dan carpenter
> .
> 
I'll fix it. Thanks for your review.
