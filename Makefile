# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abouhaga <abouhaga@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/14 16:55:09 by abouhaga          #+#    #+#              #
#    Updated: 2023/06/10 23:04:39 by abouhaga         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	cd srcs ; docker-compose up --build

up:
	cd srcs ; docker-compose up

down:
	cd srcs ; docker-compose down

delete:
	cd srcs ; docker system prune -a

rm_volumes:
	docker ps -aq | xargs docker rm -fv && docker volume ls -q | xargs docker volume rm 
rm_data:
	rm -rf /home/abouhaga/data/wordpress/* && rm -rf /home/abouhaga/data/database/*