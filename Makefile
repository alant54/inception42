# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lalvarez                                   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/15 10:42:00 by lalvarez          #+#    #+#              #
#    Updated: 2024/06/15 10:42:00 by lalvarez         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

down :
	@docker compose -f ./srcs/docker-compose.yml down

delete :
	@docker compose -f ./srcs/docker-compose.yml down --rmi all

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

start :
	@docker compose -f ./srcs/docker-compose.yml start

status :
	@docker ps