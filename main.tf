module "network" {
  source = "./network"

  vpc_name  = var.vpc_name
  vpc_cider = var.vpc_cider

  public_subnet_1a       = var.private_subnet_1a
  public_subnet_1a_cider = var.public_subnet_1a_cider
  public_subnet_1b       = var.public_subnet_1b
  public_subnet_1b_cider = var.public_subnet_1b_cider

  private_subnet_1a       = var.private_subnet_1a
  private_subnet_1a_cider = var.private_subnet_1a_cider
  private_subnet_1b       = var.private_subnet_1b
  private_subnet_1b_cider = var.private_subnet_1b_cider

  availability_zone_1a = var.availability_zone_1a
  availability_zone_1b = var.availability_zone_1b

  workSpace = var.workSpace
}