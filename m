From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 May 2015 09:02:27 +0000
Subject: re: firmware: fix possible use after free on name on asynchronous request
Message-Id: <20150528090227.GA13248@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Luis R. Rodriguez,

The patch f9692b2699bd: "firmware: fix possible use after free on
name on asynchronous request" from May 12, 2015, leads to the
following static checker warning:

	drivers/base/firmware_class.c:1311 request_firmware_nowait()
	warn: possible memory leak of 'fw_work'

drivers/base/firmware_class.c
  1296  int
  1297  request_firmware_nowait(
  1298          struct module *module, bool uevent,
  1299          const char *name, struct device *device, gfp_t gfp, void *context,
  1300          void (*cont)(const struct firmware *fw, void *context))
  1301  {
  1302          struct firmware_work *fw_work;
  1303  
  1304          fw_work = kzalloc(sizeof(struct firmware_work), gfp);
  1305          if (!fw_work)
  1306                  return -ENOMEM;
  1307  
  1308          fw_work->module = module;
  1309          fw_work->name = kstrdup_const(name, gfp);
  1310          if (!fw_work->name)

kfree(fw_work).

  1311                  return -ENOMEM;
  1312          fw_work->device = device;
  1313          fw_work->context = context;
  1314          fw_work->cont = cont;
  1315          fw_work->opt_flags = FW_OPT_NOWAIT | FW_OPT_FALLBACK |
  1316                  (uevent ? FW_OPT_UEVENT : FW_OPT_USERHELPER);
  1317  
  1318          if (!try_module_get(module)) {
  1319                  kfree_const(fw_work->name);
  1320                  kfree(fw_work);
  1321                  return -EFAULT;
  1322          }
  1323  
  1324          get_device(fw_work->device);
  1325          INIT_WORK(&fw_work->work, request_firmware_work_func);
  1326          schedule_work(&fw_work->work);
  1327          return 0;
  1328  }

regards,
dan carpenter
