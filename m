From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jun 2015 12:49:37 +0000
Subject: re: libnvdimm: control (ioctl) messages for nvdimm_bus and nvdimm devices
Message-Id: <20150623124937.GA6019@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan Williams,

The patch 85af0c1db6d8: "libnvdimm: control (ioctl) messages for
nvdimm_bus and nvdimm devices" from Jun 8, 2015, leads to the
following static checker warning:

	drivers/nvdimm/bus.c:484 __nd_ioctl()
	warn: should we be adding 'in_size' of the min_t value?

drivers/nvdimm/bus.c
   466          /* process an input envelope */
   467          for (i = 0; i < desc->in_num; i++) {
   468                  u32 in_size, copy;
   469  
   470                  in_size = nd_cmd_in_size(nvdimm, cmd, desc, i, in_env);
   471                  if (in_size = UINT_MAX) {
   472                          dev_err(dev, "%s:%s unknown input size cmd: %s field: %d\n",
   473                                          __func__, dimm_name, cmd_name, i);
   474                          return -ENXIO;
   475                  }
   476                  if (!access_ok(VERIFY_READ, p + in_len, in_size))
   477                          return -EFAULT;
   478                  if (in_len < sizeof(in_env))
   479                          copy = min_t(u32, sizeof(in_env) - in_len, in_size);
   480                  else
   481                          copy = 0;
   482                  if (copy && copy_from_user(&in_env[in_len], p + in_len, copy))
   483                          return -EFAULT;
   484                  in_len += in_size;

The warning message is saying that probably this should be:

			in_len += copy;

I think this is true.  On most iterations an invalid "in_size" would be
caught perhaps except on the last iteration.  It means "in_len" is
something invalid when we use it below.

   485          }
   486  
   487          /* process an output envelope */
   488          for (i = 0; i < desc->out_num; i++) {
   489                  u32 out_size = nd_cmd_out_size(nvdimm, cmd, desc, i,
   490                                  (u32 *) in_env, (u32 *) out_env);
   491                  u32 copy;
   492  
   493                  if (out_size = UINT_MAX) {
   494                          dev_dbg(dev, "%s:%s unknown output size cmd: %s field: %d\n",
   495                                          __func__, dimm_name, cmd_name, i);
   496                          return -EFAULT;
   497                  }
   498                  if (!access_ok(VERIFY_WRITE, p + in_len + out_len, out_size))

Most of the time an invalid "in_len" doesn't really matter.  Maybe it
could be used to trigger an integer overflow?

   499                          return -EFAULT;
   500                  if (out_len < sizeof(out_env))
   501                          copy = min_t(u32, sizeof(out_env) - out_len, out_size);
   502                  else
   503                          copy = 0;
   504                  if (copy && copy_from_user(&out_env[out_len],
   505                                          p + in_len + out_len, copy))
   506                          return -EFAULT;
   507                  out_len += out_size;
   508          }
   509  
   510          buf_len = out_len + in_len;


So "buflen" is something invalid.  Integer overflow as well?

   511          if (!access_ok(VERIFY_WRITE, p, sizeof(buf_len)))
                                                ^^^^^^^^^^^^^^^

This is shoud be:

		if (!access_ok(VERIFY_WRITE, p, buf_len))

These days Linus frowns on anyone using __copy_to/from_user unless they
have benchmark data to prove it matters so do we even need this
access_ok() check?

   512                  return -EFAULT;
   513  
   514          if (buf_len > ND_IOCTL_MAX_BUFLEN) {
   515                  dev_dbg(dev, "%s:%s cmd: %s buf_len: %zu > %d\n", __func__,
   516                                  dimm_name, cmd_name, buf_len,
   517                                  ND_IOCTL_MAX_BUFLEN);
   518                  return -EINVAL;
   519          }
   520  
   521          buf = vmalloc(buf_len);
   522          if (!buf)
   523                  return -ENOMEM;
   524  
   525          if (copy_from_user(buf, p, buf_len)) {
   526                  rc = -EFAULT;
   527                  goto out;
   528          }
   529  
   530          nvdimm_bus_lock(&nvdimm_bus->dev);
   531          rc = nd_cmd_clear_to_send(nvdimm, cmd);
   532          if (rc)
   533                  goto out_unlock;
   534  
   535          rc = nd_desc->ndctl(nd_desc, nvdimm, cmd, buf, buf_len);

This is the only place where two bugs might make a difference.  I didn't
follow it through.  Probably it is not exploitable, but it's worth
cleaning up.

   536          if (rc < 0)
   537                  goto out_unlock;
   538          if (copy_to_user(p, buf, buf_len))
   539                  rc = -EFAULT;
   540   out_unlock:
   541          nvdimm_bus_unlock(&nvdimm_bus->dev);
   542   out:
   543          vfree(buf);
   544          return rc;
   545  }

regards,
dan carpenter
